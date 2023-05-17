Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A92E70706A
	for <lists+squashfs-devel@lfdr.de>; Wed, 17 May 2023 20:07:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1pzLYX-00039S-78;
	Wed, 17 May 2023 18:07:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1pzLYV-00039L-NA
 for squashfs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 18:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MYXPOZssc6bF1t3K6T5mVqu/xSHSV/JoOTC0x07Xyfw=; b=P1ZMDBN++180A9OTq+UZMISsbH
 NY36ogyMf2Qs9pJB33unIBf7lQYdGEhNTBo4dd0WAdd4+ZlSeeLPzsfs2sp5iTK/aZAIn0xSc5bDA
 UIqeoRlgbKnUzwp1IfTDUk2NNjfwTYkpGLtZfN3XeWy+hUP0Y5i9gbHzo2ELPf62fJqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MYXPOZssc6bF1t3K6T5mVqu/xSHSV/JoOTC0x07Xyfw=; b=a2+roRkvyIR3ktNbZovXOIaipv
 2sD7SP0J6WgsBXw9nPTlWbUjRdQnw9P71zQZV1+7xssrR0ozi2SnM29e6nsQw5n4Qmc3dXXX891Fa
 LnohU6bR2hTz6QylTV+GmRmrCIzt9dYFx/Xvoxa4Bg2W5BLonjJVFhXc8RtrKdcpfWpQ=;
Received: from p3plsmtp22-03-2.prod.phx3.secureserver.net ([68.178.252.58]
 helo=p3plwbeout22-03.prod.phx3.secureserver.net)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzLYR-0003an-7S for squashfs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 18:07:19 +0000
Received: from mailex.mailcore.me ([94.136.40.141]) by :WBEOUT: with ESMTP
 id zLFWpoCItgOQ4zLFXp16EE; Wed, 17 May 2023 10:47:44 -0700
X-CMAE-Analysis: v=2.4 cv=Adp0o1bG c=1 sm=1 tr=0 ts=64651340
 a=bheWAUFm1xGnSTQFbH9Kqg==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=P0xRbXHiH_UA:10 a=FXvPX3liAAAA:8
 a=IoMjfNCK1isbzoXsNuIA:9 a=QEXdDO2ut3YA:10 a=SM4aVyO6fsoA:10
 a=UxLD5KG5Eu0A:10 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: zLFWpoCItgOQ4
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.87])
 by smtp05.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1pzLFa-0006vm-O3; Wed, 17 May 2023 18:47:47 +0100
Message-ID: <6c9e3b5d-093f-b7b7-2370-04d3953dc9cd@squashfs.org.uk>
Date: Wed, 17 May 2023 18:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Christoph Hellwig <hch@lst.de>
References: <20230517071622.245151-1-hch@lst.de>
Content-Language: en-GB
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20230517071622.245151-1-hch@lst.de>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfAzJl0fEKSDp3y+FUANslnYPdaf/8Z9Lx8MFzOR4lM+lfX9k8clmTlArsVYRZkRu6zYIC905V5E9H7ljlyOITj8JiycVJmEsYOYjDysWhmTVXhVZbZFH
 qplgCN7qqEToJyEyGONBBH3lC3qyVdYmpDaPhwIXwBdWy7XU9sJ2d+ZYCaNWfk+x88iGZUBvvM/IpwudX7wfz2UZWBEa5PRiVOIE2z306/QjJJx/eZAh/Jfi
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 17/05/2023 08:16, Christoph Hellwig wrote: > Squashfs has
 stopped using buffers heads in 93e72b3c612adcaca1 > ("squashfs: migrate from
 ll_rw_block usage to BIO"). > > Signed-off-by: Christoph Hellw [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [68.178.252.58 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pzLYR-0003an-7S
Subject: Re: [Squashfs-devel] [PATCH] squashfs: don't include buffer_head.h
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
Cc: linux-fsdevel@vger.kernel.org, squashfs-devel@lists.sourceforge.net,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On 17/05/2023 08:16, Christoph Hellwig wrote:
> Squashfs has stopped using buffers heads in 93e72b3c612adcaca1
> ("squashfs: migrate from ll_rw_block usage to BIO").
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Phillip Lougher <phillip@squashfs.org.uk>




_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
