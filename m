Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFFD5274CF
	for <lists+squashfs-devel@lfdr.de>; Sun, 15 May 2022 03:17:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nq2sW-0001Id-Qv; Sun, 15 May 2022 01:16:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1npqJD-0003A7-5Q
 for squashfs-devel@lists.sourceforge.net; Sat, 14 May 2022 11:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SYetQsXYJ6v4hzBkbaZT00INLkhixyLbrap2Z4dI6sg=; b=QtZRY0UPAy/MrrZRAsXKjyWn71
 Brx8zE42/Oe6H3wU20Geg6lSZXjmcbLAaT700SVgTEjwjDHeepVfO7GdzTxcU2WozFggtb0YXJPHa
 Phy4JSJ03VZl1++Bk4+R1TewQiUrRSel/hyvKoVMDB92ZUtAHFBWnTefP2tuh+9doFWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SYetQsXYJ6v4hzBkbaZT00INLkhixyLbrap2Z4dI6sg=; b=g+SoR+TGof0Zsn6DyO/MG8UU9S
 7kHZoZVf05xaMNYWiV7wcRaCTbpKd2cBCHzlvBL6zbuoLTNd1L31e/atU403cuUZH3IieUPo+K/lV
 HqmC1g/tmwCXamDIdbNZY3rp2YUuH0J1CjaccgS6UVYOxeYOUmDYIsJEnkfp8N3e8S0M=;
Received: from mail-vs1-f48.google.com ([209.85.217.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1npqJC-00C85Z-JW
 for squashfs-devel@lists.sourceforge.net; Sat, 14 May 2022 11:51:43 +0000
Received: by mail-vs1-f48.google.com with SMTP id q2so10949926vsr.5
 for <squashfs-devel@lists.sourceforge.net>;
 Sat, 14 May 2022 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SYetQsXYJ6v4hzBkbaZT00INLkhixyLbrap2Z4dI6sg=;
 b=WztLMRU9Cjluo2wWZ0TOGFYm+8EbrUXp9qx6VlONLF9nKwn0AIjiLc0JbQA6UHDC5N
 EDBNdozkQXEC+KVxvsXzVN2uaOUEcvAIRc7ZUJ1l5Tr92zF2RdsuYcJzd4Epx7EbWYAh
 zGtYtlFxRg8sRT7O8kaqzmNQ9Gdrh4uUgLYqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SYetQsXYJ6v4hzBkbaZT00INLkhixyLbrap2Z4dI6sg=;
 b=zdYsAIzYZ5gK9wDSw2OuPXo86ul8E11JXL0NPplQlmfBj12YfkV05qTXzXQw3TJJsU
 PUBHKPSSVjFzkKtjwH0cYTg0NOdreWzjwmzLXaumEnmY55rBqzTHQDlJRk1esELcfPjh
 +hKFf4Oyf6i7OSeGlWMhghJ2DUx39pUF2Y/C/aR5Z8N+ke/NMmQVtkWKsW+ja5kXJwPi
 ePWx67fumICaYzMpuii4gM4Kj2lnMlubFRFkPJ8kZakcbPxqoMFMvifPlxIwZCeCX0ql
 5Zzohlv+AP80QdMk/E2JG1qZdSI2l8AvrO7Qb6D06tPAsGt4o5qIN7X0VeUkO+MhwGX6
 MJRw==
X-Gm-Message-State: AOAM531dBQPY4u+q/kKYWpaZ5QmarT1H7IkCmMtRWOJGTfa1pc2/EhNd
 v4W2rQV4vB4KxIq387dn95AB9ZBnDD5poI3EC2qd+g==
X-Google-Smtp-Source: ABdhPJwoHCwk6II6x3Gb99Z/RwHHsskVHwjSngD75R3yC1XCHsE6XFtSJZtHG0htRjlvQULyvlV47VSj6U5X1KuJNl0=
X-Received: by 2002:a67:f445:0:b0:32c:c32c:c7c1 with SMTP id
 r5-20020a67f445000000b0032cc32cc7c1mr3479858vsn.51.1652529096680; Sat, 14 May
 2022 04:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
 <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
 <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
 <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
 <CAJMQK-h3p72P=Ltpk9X1o6f56iKN6z=DimEtdGEUXf8cVabQOQ@mail.gmail.com>
 <adf436dd-d17d-7a84-68ba-0dd2125620cf@squashfs.org.uk>
 <CAJMQK-gQ+LD6t74FUwuxYVcmETgJxK8Q5_ZtuJvELm+yr=f8Yg@mail.gmail.com>
 <CAEVVKH-VyKsFwOrY2kc7JPWtOB=usXtdia6tgcBwJCkcWPFx7g@mail.gmail.com>
 <CAJMQK-jx1_Zibxa48RSSKsFdt5kfoS22Csm5a_9sqTqGXOuCuA@mail.gmail.com>
 <Yn6fjVg6mzVJBNt0@casper.infradead.org>
In-Reply-To: <Yn6fjVg6mzVJBNt0@casper.infradead.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Sat, 14 May 2022 19:51:10 +0800
Message-ID: <CAJMQK-jr7OD29gtU_90zgNw+XmSzDhei-p6ks6vwoQt+Wr6E0w@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, May 14,
 2022 at 2:12 AM Matthew Wilcox <willy@infradead.org>
 wrote: > > On Sat, May 14, 2022 at 12:43:47AM +0800, Hsin-Yi Wang wrote:
 > > > One stupid question, see below code from your patch: [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.48 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.48 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npqJC-00C85Z-JW
X-Mailman-Approved-At: Sun, 15 May 2022 01:16:57 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "Song, Xiongwei" <Xiongwei.Song@windriver.com>,
 Zhang Yi <yi.zhang@huawei.com>, Xiongwei Song <sxwjean@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Hou Tao <houtao1@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Sat, May 14, 2022 at 2:12 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sat, May 14, 2022 at 12:43:47AM +0800, Hsin-Yi Wang wrote:
> > > One stupid question, see below code from your patch:
> > >
> > >  +       }
> > >  +
> > >  +       kfree(actor);
> > >  +       return;
> > >  +
> > >  +skip_pages:
> > >
> > > when release page pointers array after pages cached? I don't see
> > > any chance to do that.
> > >
> > actor is not a page pointer. This is allocated from
> > squashfs_page_actor_init() and should be freed after use. Or do you
> > mean skip_pages? There are some situations where we can't decompress
> > the whole block, so we will skip those pages.
>
> I think the concern is that you don't seem to kfree(pages) on this
> exit path.

Got it. I'll update in the next version.


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
