Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5824DCDF8
	for <lists+squashfs-devel@lfdr.de>; Thu, 17 Mar 2022 19:50:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nUvCe-0007vW-OL; Thu, 17 Mar 2022 18:50:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1nUMU5-0001Re-5N
 for squashfs-devel@lists.sourceforge.net; Wed, 16 Mar 2022 05:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uLQl1k3YPUO+oDkdnKWyv2CBQJX9H+XniS8nD3XjVAA=; b=B9G+4VtpTtAo7dUQBJkPy0is1P
 AwDTDuqQS5CubpZv6xJ4OExYcHLnryNK0ZS7KNh3HU0mhgm/qoOFKFL0BZUqz8PV6SgFxe5evOn7L
 lSXZHl4+3Ry4KyIg50/nasPUFo8xCrUSphZv6Pf727V1977qQ8suESJFqlOWQ2QBN55U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uLQl1k3YPUO+oDkdnKWyv2CBQJX9H+XniS8nD3XjVAA=; b=KRVxdF32mMlrcigRcC6BHahan7
 OvYAaEqtTAmhD29yfM1mw+COoHa8MoThu4QKjWfqn6uE7KHSWqTBRfJLjrCWbllaUCYe0L8SXzSAn
 XEey0K+vEdk7QBRxXMcpo2Z3oC899bIHIsfOAGAFyLK/T2kdjW6UXo1u2MZVL6fpcFUc=;
Received: from p3plsmtp25-04-2.prod.phx3.secureserver.net ([216.69.139.18]
 helo=p3plwbeout25-04.prod.phx3.secureserver.net)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nUMbx-000aZD-CT
 for squashfs-devel@lists.sourceforge.net; Wed, 16 Mar 2022 05:54:20 +0000
Received: from mailex.mailcore.me ([94.136.40.143]) by :WBEOUT: with ESMTP
 id UMJ4nYE9sOE5hUMJ5nrPv2; Tue, 15 Mar 2022 22:34:47 -0700
X-CMAE-Analysis: v=2.4 cv=Ve0ygHl9 c=1 sm=1 tr=0 ts=623176f7
 a=EhJYbXVJKsomWlz4CTV+qA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=o8Y5sQTvuykA:10 a=vqTx_GAQ2IFItUb59xIA:9
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: UMJ4nYE9sOE5h
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=linux.fritz.box) by smtp05.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1nUMJ3-0006eR-KR; Wed, 16 Mar 2022 05:34:45 +0000
From: Phillip Lougher <phillip@squashfs.org.uk>
To: a.fatoum@pengutronix.de
Date: Wed, 16 Mar 2022 05:34:28 +0000
Message-Id: <20220316053428.5758-1-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c22a0f1c-883d-5122-ef88-0d7c57ab4e66@pengutronix.de>
References: <c22a0f1c-883d-5122-ef88-0d7c57ab4e66@pengutronix.de>
MIME-Version: 1.0
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfGepsKFSOHHAJNiIeNKkso8Zj8ngdXiVfn+RIHaYTWecp4QP0DpGUuDAhFxIW86ZdSl9sNRtTXpGlfCuOip8VM0xDAm3h6RGrJvsuQuNoXkvQubqxx91
 4MO3g+ObEEq0KTFKRGHTa/3wNxa6PVYUjwDhryJCg5cFaRNf7z5NYrgMJJKEXh7VzAC6BuyteRGPfPEtxnxkR++UGMf0ugraA5HBHOxxyWYWg0ZuODZDhzQc
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ahmad Fatoum <a.fatoum@pengutronix.de> wrote: > Hello, > >
 This an issue we had with v5.15 that we have since successfully worked around.
 > I am reporting it here as a pointer in case someone else runs into this
 and as > a heads up that there see [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.69.139.18 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1nUMbx-000aZD-CT
X-Mailman-Approved-At: Thu, 17 Mar 2022 18:50:06 +0000
Subject: Re: [Squashfs-devel] Possible performance regression with
 CONFIG_SQUASHFS_DECOMP_SINGLE
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
Cc: squashfs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> Hello,
> 
> This an issue we had with v5.15 that we have since successfully worked around.
> I am reporting it here as a pointer in case someone else runs into this and as
> a heads up that there seems to be an underlying performance regression, so
> here it goes:
> 

[snip]

> 
> Looking through the original kernel configuration we found that it has
>  CONFIG_SQUASHFS_DECOMP_SINGLE=y and CONFIG_SQUASHFS_FILE_CACHE=y.
> 
> Once changed to CONFIG_SQUASHFS_FILE_DIRECT=y and
> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y, we were below 40s as we want.

This sounds like the slow-down that was introduced by commit c1f6925e1091
"mm: put readahead pages in cache earlier" (Linux V5.8)

This commit prevents Squashfs from doing it's own readahead, which
causes a slow-down in performance.  The slow-down is noticable when
using a single decompressor (CONFIG_SQUASHFS_DECOMP_SINGLE=y), and
can be solved by moving to a multi-decompressor configuration, because
it removes contention on a single buffer in the single decompressor case.

This has been already been fixed by commit 9eec1d897139
"squashfs: provide backing_dev_info in order to disable read-ahead"
which is in Linux 5.17-rc1.

Phillip


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
